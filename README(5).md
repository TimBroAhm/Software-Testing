# Software Testing

A collection of automated test suites for functional, performance, and security testing. The project combines Robot Framework test suites with Python scripts, including Locust for load testing.

## Repository Contents

| File | Description |
|------|-------------|
| `CategoryTestSuite.robot` | Robot Framework suite for functional tests |
| `PerformanceTestSuite.robot` | Robot Framework suite for performance tests |
| `SecurityTestSuite.robot` | Robot Framework suite for security tests |
| `locustfile.py` | Locust load test definition |
| `locust.py` | Additional Locust script |
| `sqlenj.py` | Python script for SQL injection testing |
| `tasks.py` | Task definitions used by the test scripts |
| `test.py` | Python test script |

## Types of Testing

- **Functional testing:** verifies that features behave as expected.
- **Performance testing:** measures how the system responds under load.
- **Security testing:** checks the system for common vulnerabilities such as SQL injection.

## Tech Stack

Python · Robot Framework · Locust

## Getting Started

### Prerequisites

- Python 3.9+
- pip

### Installation

```bash
git clone https://github.com/TimBroAhm/Software-Testing.git
cd Software-Testing
pip install robotframework locust
```

Each Robot Framework suite lists any additional libraries it needs in its Settings section.

### Run the Robot Framework Suites

```bash
robot CategoryTestSuite.robot
robot PerformanceTestSuite.robot
robot SecurityTestSuite.robot
```

Robot Framework generates `report.html` and `log.html` with the results of each run.

### Run the Load Test

```bash
locust -f locustfile.py
```

Then open `http://localhost:8089` in your browser, enter the number of users and spawn rate, and start the test.

## Responsible Use

Run these tests, especially the security tests, only against systems you own or have explicit permission to test.

## Future Work

- Integrate the suites into a CI pipeline
- Add more test cases and coverage for edge cases
- Generate combined reports across functional, performance, and security runs

## Author

**Tim** ([@TimBroAhm](https://github.com/TimBroAhm))
