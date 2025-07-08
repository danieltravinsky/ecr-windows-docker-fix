# Fix Bad Stub error
Windows 11 ( And possible older versions ) suffer from an issue when logging into AWS ECR via `aws ecr get-login-password --region {region} | docker login --username AWS --password-stdin {account id}.dkr.ecr.{region}.amazonaws.com` stating the following `Error saving credentials: error storing credentials - err: exit status 1, out: error storing credentials - err: exit status 1, out: The stub received bad data.`.
  
The issue seems to stem from changes in how AWS handles login credentials and keys using a string that is too long for the Windows credential manager to handle.
  
This fix simply changes the credential manager Docker uses to save the key as raw text on your machine.
The only file changed is %USERPROFILE%\.docker\config.json
  
> [!WARNING]
> Raw text passwords and credentials can be dangerous to make sure you trust the machine you're working on and handle the files correctly
  
## How to run
Simply run [fix-bad-stub.ps1](fix-bad-stub.ps1) in powershell, restart Docker Desktop, and rerun the ECR login command.

Thanks to @mirco-bozzolini for the fix
Read more about the issue in the [aws-cli issues #5636](https://github.com/aws/aws-cli/issues/5636#issuecomment-2697132067)

[![AVATAR](https://images.weserv.nl/?url=avatars.githubusercontent.com/u/73277118?v=4&width=50&height=50&mask=circle&maxage=7d
)](https://github.com/danieltravinsky)
