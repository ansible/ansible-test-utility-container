#include <stdio.h>
#include <libaudit.h>

int main() {
    printf("%d\n", audit_request_status(audit_open()));
}
