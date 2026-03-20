Import-Module ActiveDirectory

# Variables
$domain = "lab.local"
$csvPath = "C:\Users\frank\Desktop\02-Users-Xmen.csv"
$defaultPassword = ConvertTo-SecureString "Xmen2!Xmen2!" -AsPlainText -Force

# Locations (OUs)
$locations = @(
    "Westchester County",
    "Madripoor",
    "Muir Island",
    "Krakoa",
    "San Francisco"
)

# Security Groups
$groups = @(
    "Executive",
    "Finance",
    "HR",
    "Marketing",
    "Operations",
    "Sales",
    "Security",
    "Technology",
    "All Employees"
)

# Create OUs
foreach ($loc in $locations) {
    if (-not (Get-ADOrganizationalUnit -Filter "Name -eq '$loc'" -ErrorAction SilentlyContinue)) {
        New-ADOrganizationalUnit -Name $loc -Path "DC=lab,DC=local"
    }
}

# Create Security Groups (in root for simplicity)
foreach ($group in $groups) {
    if (-not (Get-ADGroup -Filter "Name -eq '$group'" -ErrorAction SilentlyContinue)) {
        New-ADGroup -Name $group `
                    -GroupScope Global `
                    -GroupCategory Security `
                    -Path "DC=lab,DC=local"
    }
}

# Import CSV
$users = Import-Csv -Path $csvPath

foreach ($user in $users) {

    $firstName = ($user.Name.Split(" "))[0]
    $lastName  = ($user.Name.Split(" "))[1]

    $samAccountName = $user.Alias
    $userPrincipalName = "$($user.Alias)@$domain"

    $ouPath = "OU=$($user.Location),DC=lab,DC=local"

    # Check if user exists
    if (-not (Get-ADUser -Filter "SamAccountName -eq '$samAccountName'" -ErrorAction SilentlyContinue)) {

        New-ADUser `
            -Name "$firstName $lastName" `
            -GivenName $firstName `
            -Surname $lastName `
            -SamAccountName $samAccountName `
            -UserPrincipalName $userPrincipalName `
            -Department $user.Dept `
            -Title $user.Title `
            -Office $user.Location `
            -Path $ouPath `
            -AccountPassword $defaultPassword `
            -Enabled $true `
            -ChangePasswordAtLogon $false `
            -PasswordNeverExpires $true
    }

    # Add user to their department group
    if ($user.Dept) {
        Add-ADGroupMember -Identity $user.Dept -Members $samAccountName -ErrorAction SilentlyContinue
    }

    # Add user to All Employees group
    Add-ADGroupMember -Identity "All Employees" -Members $samAccountName -ErrorAction SilentlyContinue
}