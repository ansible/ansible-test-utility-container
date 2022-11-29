"""Create a C header file containing an error_table to allow looking up error codes from error numbers."""
import errno

error_max = max(errno.errorcode)
error_codes = ['OK'] + [errno.errorcode.get(error_num, '?') for error_num in range(1, error_max + 1)]
max_width = max(len(error_code) for error_code in error_codes)

print(f'const int error_max = {error_max};')
print('const char * const error_table[] = {')

for idx, error_code in enumerate(error_codes):
    print(f'    "{error_code}",  {(max_width - len(error_code)) * " "}// {idx:>3}')

print('};')
