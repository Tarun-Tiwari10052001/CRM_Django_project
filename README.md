# **@Student Management System** 🎓

## 🚀 About Me
## *I'm a DevOps Engineer.....*

# Hi, I'm Tarun Tiwari 👋

## 🔗 Links
[![linkedin](https://img.shields.io/badge/linkedin-0A66C2?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/devops-tarun)
[![GitHub](https://img.shields.io/badge/GitHub-000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/Tarun-Tiwari10052001)

# 🛠 Skills

## DevOps & Cloud
- **DevOps**: Streamlining development and operations for better collaboration.
- **AWS Cloud Services**: Leveraging cloud infrastructure for scalable solutions.
- **Jenkins**: Implementing CI/CD pipelines for automated testing and deployment.

## Containerization & Orchestration
- **Docker**: Containerizing applications for consistency across environments.
- **Kubernetes & Helm**: Managing and deploying containerized applications at scale.

## Infrastructure as Code
- **Terraform**: Automating infrastructure provisioning and management.
- **Ansible**: Configuring and managing systems for seamless operations.

## System Administration
- **Linux**: Proficient in managing and configuring Linux systems.
- **Git & GitHub**: Version control and collaborative coding practices.

## Scripting & Automation
- **Scripting Languages**: Experienced in Python and Bash for automation tasks.

## Networking
- **Networking**: Understanding of network configurations and protocols for robust system connectivity.

---



# Django CRM Project Setup 🚀

This document provides instructions for setting up a Django project for a CRM application.

## Prerequisites

Make sure you have `sudo` privileges on your system.

# Installation Steps
## 1. Set Up Your Development Environment

1. **Update Package List**  
    ```bash
    sudo apt update
    ```

2. **Check Python Version**
    ```bash
    python3 --version
    ```

3. **Install pip**
    ```bash
    sudo apt install python3-pip
    ```

4. **Install Virtual Environment Package**
    ```bash
    sudo apt install python3.12-venv
    ```
5. **Create a Virtual Environment**
    ```bash
    python3 -m venv myenv
    ```

6. **Activate Virtual Environment**
    ```bash
    source myenv/bin/activate
    ```

7. **Install Virtualenv**
    ```bash
    pip install virtualenv
    ```

8. **Install pipx**
    ```bash
    sudo apt install pipx
    ```
## 2. Install Django
- **Install Django**
    ```bash
    pip install django
    ```
## 3. Create a New Django Project
1. **Start a New Django Project**
    ```bash
    django-admin startproject crm_project
    ```

2. **Change Directory to Project**
    ```bash
    cd crm_project
    ```

3. **Run Django Development Server**   ## Try to run it; if it’s not running, no worries.
    ```bash
    python manage.py runserver
    ```

4. **Apply Migrations**
    ```bash
    python manage.py migrate
    ```

5. **Run Server on Specific IP** ## Try to run it; if it’s not running, no worries.
    ```bash
    python manage.py runserver 0.0.0.0:8000
    ```
## 4. Create a Django App
1. **Create a New App**
    ```bash
    python manage.py startapp students
    ```
2. **Edit Installed Apps**
    ```bash
    nano crm_project/settings.py
    ```
    Update `ALLOWED_HOSTS` to:
    ```python
    ALLOWED_HOSTS = ['192.168.0.109', 'localhost', '127.0.0.1']
    ```
    Add `'students',` to the `INSTALLED_APPS` list.
![Alt text](https://github.com/Tarun-Tiwari10052001/CRM_Django_project/blob/master/Imges/4.2-after.png)

## 5. Define Models

1. **Create Models in `students/models.py`**
    ```bash
    nano students/models.py
    ```
    Add the following code:
    ```python
    from django.db import models

    class Student(models.Model):
        first_name = models.CharField(max_length=100)
        last_name = models.CharField(max_length=100)
        email = models.EmailField()
        phone_number = models.CharField(max_length=15, blank=True)
        enrollment_date = models.DateField()

        def __str__(self):
            return f"{self.first_name} {self.last_name}"
    ```
![Alt text](https://github.com/Tarun-Tiwari10052001/CRM_Django_project/blob/master/Imges/5.1%20after.png)

2. **Apply Migrations**
    ```bash
    python manage.py makemigrations
    python manage.py migrate
    ```

## 6. Define Views

1. **Create a View in `students/views.py`**
    ```bash
    nano students/views.py
    ```
    Add the following code:
    ```python
    from django.shortcuts import render
    from .models import Student

    def student_list(request):
        students = Student.objects.all()
        return render(request, 'students/student_list.html', {'students': students})
    ```



2. **Create Template Directory**
    ```bash
    cd students/
    mkdir -p templates/students
    ```

3. **Create Template File**
    ```bash
    nano templates/students/student_list.html
    ```
    Add the following code:
    ```html
    <!DOCTYPE html>
    <html>
    <head>
        <title>Student List</title>
    </head>
    <body>
        <h1>Student List</h1>
        <ul>
            {% for student in students %}
                <li>{{ student.first_name }} {{ student.last_name }} - {{ student.email }}</li>
            {% endfor %}
        </ul>
    </body>
    </html>
    ```

## 7. Set Up URLs

1. **Edit  `/crm_project/students/urls.py`**
    ```bash
    nano students/urls.py
    ```
    Add the following code:

    ```python
    from django.urls import path
    from . import views

    urlpatterns = [
        path('', views.student_list, name='student_list'),
    ]

    ```

2. **Edit `urls.py`**
    ```bash
    nano /crm_project/crm_project/urls.py
    ```
    Include the app URLs:
    ```python
    from django.contrib import admin
    from django.urls import path, include

    urlpatterns = [
        path('admin/', admin.site.urls),
        path('students/', include('students.urls')),
    ]
    ```

## 8. Add Admin Interface

1. **Register Models in `students/admin.py`**
    ```bash
    nano /crm_project/students/admin.py
    ```
    Add the following code:
    ```python
    from django.contrib import admin
    from .models import Student

    admin.site.register(Student)
    ```

2. **Create Superuser**
    ```bash
    python manage.py createsuperuser
    ```
# Finally run project in your browser

1. **Run Server on Specific IP**  *run command*
    ```bash
    python manage.py runserver 0.0.0.0:8000
    ```
2. **Access it in your browser**
    ```bash
    localhost:8000/student  or localhost:8000/admin
      ```
![Alt text](https://github.com/Tarun-Tiwari10052001/CRM_Django_project/blob/master/Imges/crm_final_1.png) 
![Alt text](https://github.com/Tarun-Tiwari10052001/CRM_Django_project/blob/master/Imges/crm_final2.png)
## Conclusion

You have successfully set up a Django CRM project. You can now start building your application!
