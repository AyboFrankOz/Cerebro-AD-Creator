# Cerebro-AD-Creator
This project is a PowerShell-based Active Directory automation script designed for home lab environments. It programmatically creates 70+ users inspired by X-Men characters, assigns them to Organizational Units (OUs), security groups, and departments, and simulates a realistic enterprise structure.

## What This Script Does
* Imports users from your CSV (02-Users-Xmen.csv)
* Creates users in Active Directory
* Assigns user attributes: department, title, location
* Creates OUs for locations: Westchester County, Madripoor, Muir Island, Krakoa, San Francisco
* Creates security groups: Executive, Finance, HR, Marketing, Operations, Sales, Security, Technology, All
* Sets user logon names by importing their aliases from the CSV 
* Sets the password to Xmen2!Xmen2! for all users and disables “password change at next logon”
* Adds users to appropriate groups (including “All Employees”)

## How to Setup
Download 01-ADbuildout.ps1 and 02-Users-Xmen.csv and move them to the desktop. Before running 01-ADbuildout.ps1, make sure to update the CSV file path in the script. The default path is set to: C:\Users\frank\Desktop\02-Users-Xmen.csv 
You will need to modify this path to match the location of the 02-Users-Xmen.csv file on your own computer, as file directories may differ between systems. Copy the code in 01-ADbuildout.ps1

You can see the screenshot before this script
![Fresh AD Before the Script](https://github.com/AyboFrankOz/Cerebro-AD-Creator/blob/f8ceb9682a8a3f6eac7799330d4293fdb5ae466e/images/1.%20Before.PNG)

Run "Windows PowerShell ISE" as an administrator
![Run Powershell](https://github.com/AyboFrankOz/Cerebro-AD-Creator/blob/f8ceb9682a8a3f6eac7799330d4293fdb5ae466e/images/2.%20Run%20Powershell.PNG)

Go to the desktop directory, where 2-Users-Xmen.csv is, on PowerShell
![Desktop Directory on Run Powershell](https://github.com/AyboFrankOz/Cerebro-AD-Creator/blob/f8ceb9682a8a3f6eac7799330d4293fdb5ae466e/images/3.%20Powershell.PNG)

Paste the script
![Paste the script](https://github.com/AyboFrankOz/Cerebro-AD-Creator/blob/f8ceb9682a8a3f6eac7799330d4293fdb5ae466e/images/4.%20Script.PNG)

**Results**

New groups were created
![Results](https://github.com/AyboFrankOz/Cerebro-AD-Creator/blob/f8ceb9682a8a3f6eac7799330d4293fdb5ae466e/images/5.%20Results%20(5).PNG)

User properties: First Name, Last Name, Office
![Results](https://github.com/AyboFrankOz/Cerebro-AD-Creator/blob/f8ceb9682a8a3f6eac7799330d4293fdb5ae466e/images/5.%20Results%20(2).PNG)

Security groups that were assigned to the user
![Results](https://github.com/AyboFrankOz/Cerebro-AD-Creator/blob/f8ceb9682a8a3f6eac7799330d4293fdb5ae466e/images/5.%20Results%20(3).PNG)

User logon name and password options[^1]
![Results](https://github.com/AyboFrankOz/Cerebro-AD-Creator/blob/f8ceb9682a8a3f6eac7799330d4293fdb5ae466e/images/5.%20Results%20(4).PNG)
[^1]:For the logon name of all users, please check 02-Users-Xmen.csv
