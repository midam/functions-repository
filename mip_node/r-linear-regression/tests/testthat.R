library(testthat);
library(hbpjdbcconnect);
library(jsonlite);

# Perform the computation
source("/src/main.R");

connect2outdb();

job_id <- Sys.getenv("JOB_ID");

# Get the results
results <- RJDBC::dbGetQuery(out_conn, "select node, data from job_result where job_id = ?", job_id);

node <- results$node[[1]];
data <- results$data[[1]];

res <- fromJSON(data);

result_beta <- res$beta;
result_sigma <- res$sigma;

# Disconnect from the database
disconnectdbs();

expect_equal(node, "Test");

expect_equal(result_beta[1,1], 1.51756892,  tolerance = 1e-6);
expect_equal(result_beta[2,1], -1.91151546, tolerance = 1e-6);
expect_equal(ncol(result_sigma), 0);

print ("[ok] Success!");
