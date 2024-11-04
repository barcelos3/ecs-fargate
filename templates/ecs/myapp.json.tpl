[
    {
        "name": "myapp",
        "image": "barcelos3/app-v1:latest",
        "cpu": 1024,
        "memory": 2048,
        "networkMode": "awsvpc",
        "portMappings": [
            {
                "containerPort": 80,
                "hostPort": 80
                
            }
        ]
    }
]