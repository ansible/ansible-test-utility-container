#include <stdio.h>
#include <libaudit.h>

#include "error-table.h"

int main() {
    const int error_number = audit_request_status(audit_open());
    int error_index = error_number * -1;
    const char * error_code;

    if (error_index < 0 || error_index > error_max)
        error_code = "??";
    else
        error_code = error_table[error_index];

    printf("%d %s\n", error_number, error_code);
}
