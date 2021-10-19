NOTE: This repo is no longer needed: https://github.com/qpdf/qpdf/issues/352#issuecomment-713606987

# QPDF

[QPDF](https://qpdf.sourceforge.net/) is a command-line program that does structural, content-preserving transformations on PDF files.

This project shows how to deploy the `qpdf` binary as an AWS Lambda Layer.

Currently the Makefile will download **QPDF 10.0.1**. You can change the version by altering the Makefile's MAJOR, MINOR, and PATCH numbers.

# AWS Lambda Layer

[Lambda Layers](https://docs.aws.amazon.com/lambda/latest/dg/configuration-layers.html) is a new convenient way to manage common dependencies between different Lambda Functions.

The following command will create a well-structured layer of this package:

```cmd
git clone https://github.com/Sparticuz/qpdf-aws-lambda.git
cd qpdf-aws-lambda
make
```

The resulting ZIP file `qpdf-aws-lambda.zip` can be uploaded to the AWS Lambda Layers console.

According to [AWS Documentation](https://docs.aws.amazon.com/lambda/latest/dg/current-supported-versions.html), there are two paths exported as environment variables directly related to AWS Lambda Layers (as they unzip under `/opt`)

* **LD_LIBRARY_PATH** includes `/opt/lib`
* **PATH** includes `/opt/bin`

The ZIP file resulting from executing `make` in this package will store both binary files under the corresponding directories, so it is ready to use system wide.

### Usage

The Layer is independent from the Lambda Function Runtime, so it should be available for any of them.
