# ats_architecture.py — LTI-JS (Jainer Samper)
from diagrams import Diagram
from diagrams.aws.compute import Fargate
from diagrams.aws.integration import Eventbridge
from diagrams.aws.database import RDS
from diagrams.aws.storage import S3
from diagrams.aws.analytics import ElasticsearchService
from diagrams.aws.network import APIGateway, CloudFront
from diagrams.aws.security import Cognito

with Diagram("ATS Architecture on AWS", show=False, direction="LR"):

    candidate = CloudFront("Candidate & Recruiter UI")
    frontend_storage = S3("Frontend Hosting")

    api_gateway = APIGateway("API Gateway")
    cognito = Cognito("Auth Service")

    core_service = Fargate("Core ATS Service")
    resume_parser = Fargate("Resume Parser")
    chatbot_service = Fargate("Chatbot Service")
    ranking_service = Fargate("Ranking Service")
    scheduler_service = Fargate("Interview Scheduler")
    notification_service = Fargate("Notification Service")

    event_bus = Eventbridge("EventBridge")

    rds_db = RDS("PostgreSQL DB")
    search = ElasticsearchService("OpenSearch")
    file_storage = S3("Resumes Storage")

    candidate >> frontend_storage >> api_gateway >> core_service
    api_gateway >> cognito

    core_service >> event_bus
    event_bus >> [resume_parser, chatbot_service, ranking_service, scheduler_service, notification_service]

    core_service >> [rds_db, search, file_storage]
    resume_parser >> core_service
    chatbot_service >> core_service
    ranking_service >> core_service
    scheduler_service >> core_service
    notification_service >> core_service
