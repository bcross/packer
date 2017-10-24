# Setup
## Install
1. Install [VirtualBox](https://www.virtualbox.org/wiki/Downloads).
1. Get [Packer](https://packer.io).
    * If you are using packerrun.bat, it gets Packer for you and keeps it up to date.
1. Make or get a folder to deploy. An example is my [docker-apphost repo](https://github.com/bcross/docker-apphost).

## Making a deployment folder
1. Make a folder.
1. Make a script file in that folder.
1. Copy the packer-variables.json.example file to packer-variables.json. Set folder_to_upload to the path of the deployment folder. Set script_to_run to the path of the script file.
1. The rest is up to your imagination.

# Run
1. Run packerrun.bat or packerrun.sh depending on your OS.
1. Profit.

## What will happen
1. Packer will download the version of the Ubuntu ISO specified in packer-variables.json into its cache if it hasn't already done so.
1. Packer will deploy a VirtualBox VM using the preseed.cfg file in the http_directory and the downloaded Ubuntu ISO.
1. Packer will upload the deployment folder and run the bootstrap.sh file.
1. You will access the VM from port 80 and 443 on localhost. If you are using these ports, change them in packer-vb-iso.json.

If Packer fails for some reason, it will stop and ask you what to do. This allows you to login and see exactly what went wrong before trying again.

# Useful links
* [Packer documentation](https://www.packer.io/docs/index.html)
* [VirtualBox VBoxManage documentation](https://www.virtualbox.org/manual/ch08.html)