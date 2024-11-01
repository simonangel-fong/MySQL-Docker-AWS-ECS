/* This is a script to test volume. */
/* Run the container and insert data. Then remove the container. */
use empdb;

INSERT INTO
    emp(firstname, lastname)
VALUES
    ("Adam", "Smith");

COMMIT;

/* Re-create a container and query. */
SELECT
    *
FROM
    emp;