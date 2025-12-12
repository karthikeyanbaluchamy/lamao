# Makefile for Lambda function

# Define the directory where dependencies will be installed
PACKAGE_DIR=package

# Define the name of the Lambda zip file
ZIP_FILE=lambda-deploy.zip

# Define the source directory where your lambda function code is located
SRC_DIR=src

# Path to the requirements.txt file inside the src folder
REQUIREMENTS_FILE=$(SRC_DIR)/requirements.txt

# Step 1: Install dependencies
install_dependencies:
	# Create a package directory and install dependencies
	rm -rf $(PACKAGE_DIR) && mkdir $(PACKAGE_DIR)
	pip install -r $(REQUIREMENTS_FILE) -t $(PACKAGE_DIR)

# Step 2: Create Lambda deployment package (zip)
package_lambda: install_dependencies
	# Copy Lambda function code from the src directory into the package folder
	cp $(SRC_DIR)/lambda_function.py $(PACKAGE_DIR)
	# Create a zip file for the Lambda deployment package
	cd $(PACKAGE_DIR) && zip -r ../$(ZIP_FILE) .

# Clean up generated files
clean:
	rm -rf $(PACKAGE_DIR) $(ZIP_FILE)
