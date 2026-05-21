.PHONY: all diagrams aws clean

JAVA ?= java
PLANTUML_JAR ?= tools/plantuml.jar
PYTHON ?= python

all: diagrams aws

diagrams: Candidate_Resume_Submission.svg AI_Candidate_Screening_Ranking.svg Conversational_Chatbot_Screening.svg C4_Context_ATS.svg C4_Container_ATS.svg C4_AI_Microservices_Component.svg

%.svg: diagrams.puml $(PLANTUML_JAR)
	$(JAVA) -jar $(PLANTUML_JAR) -tsvg -o . diagrams.puml

aws: ats_architecture_on_aws.png

ats_architecture_on_aws.png: ats_architecture.py
	$(PYTHON) ats_architecture.py

clean:
	del /Q *.svg ats_architecture_on_aws.png 2>nul || rm -f *.svg ats_architecture_on_aws.png
