from locust import HttpUser, TaskSet, task, between

class UserBehavior(TaskSet):
    def on_start(self):
        """Login once per simulated user."""
        self.client.post("/help/loginn.php", {
            "username": "Admin",
            "password": "1234"
        })

    @task(2)
    def view_dashboard(self):
        self.client.get("/help/expert_dashboard.php", name="Expert Dashboard")

    @task(1)
    def manage_profile(self):
        self.client.get("/help/profile.php", name="Manage Profile")

    @task(1)
    def coordinator_dashboard(self):
        self.client.get("/help/manager_dashbord.php", name="Manager Dashboard")

    @task(1)
    def manage_service(self):
        self.client.get("/help/manage_activities.php", name="Manage Activities")

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
        self.client.get("/help/manage_reportmanager.php", name="Manage Report Manager")

    @task(1)
    def logout(self):
        self.client.get("/help/logout.php", name="Logout")

class WebsiteUser(HttpUser):
    tasks = [UserBehavior]
    wait_time = between(1, 5)  # simulate user think time
