import docker
client = docker.from_env()

usr_image=input("Enter the image name you want to use:- ")
usr_command=input("Enter the command you want to run:- ")

print(client.containers.run(usr_image, usr_command))
