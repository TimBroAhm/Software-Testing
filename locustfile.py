from locust import HttpUser, TaskSet, task, between

class UserBehavior(TaskSet):
    def on_start(self):
        """Login once per simulated user."""
        self.client.post("/help/login.php", {
            "username": "4969",
            "password": "epss123"
        })

    @task(2)
    def view_dashboard(self):
        self.client.get("/help/officer_dashboard.php", name="Officer Dashboard")

    @task(1)
    def manage_profile(self):
        self.client.get("/help/profile.php", name="Manage Profile")

    @task(1)
    def coordinator_dashboard(self):
        self.client.get("/help/cordinator_dashbord.php", name="Coordinator Dashboard")

    @task(1)
    def manage_service(self):
        self.client.get("/help/manage_service.php", name="Manage Service")

    @task(1)
    def manage_employee(self):
        self.client.get("/help/manage_employee.php", name="Manage Employee")

    @task(1)
    def manage_department(self):
        self.client.get("/help/manage_department.php", name="Manage Department")

    @task(1)
    def manage_category(self):
        self.client.get("/help/manage_category.php", name="Manage Category")

    @task(1)
    def manage_report_cord(self):
        self.client.get("/help/manage_reportcord.php", name="Manage Report Coordinator")

    @task(1)
    def logout(self):
        self.client.get("/help/logout.php", name="Logout")

class WebsiteUser(HttpUser):
    tasks = [UserBehavior]
    wait_time = between(1, 5)  # simulate user think time
