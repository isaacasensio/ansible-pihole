.PHONY: all help ls-hostname syntax-check lint galaxy-install run

ANSIBLE=ansible
PLAYBOOK=ansible-playbook
GALAXY=ansible-galaxy
LINT=ansible-lint

all: help

help:
	@echo "Make command examples for Ansible"
	@echo "    ls-hostname                    to show all host ips"
	@echo "    print-vars                     to print out a dictionary of all of the facts"
	@echo "    syntax-check                   to run with --syntax-check option"
	@echo "    lint                           to lint playbook files"
	@echo "    galaxy-install                 to install roles using ansible-galaxy"
	@echo "    run                            to run the playbook"

ls-hostname:
	$(ANSIBLE) all -i inventory.ini -m shell -a "hostname;"

print-vars:
	$(ANSIBLE) api -i inventory.ini -m setup

syntax-check:
	$(PLAYBOOK) main.yml -i inventory.ini --syntax-check

lint:
	$(LINT) .

run:
	$(PLAYBOOK) main.yml -i inventory.ini

galaxy-install:
	$(GALAXY) install -r requirements.yml
