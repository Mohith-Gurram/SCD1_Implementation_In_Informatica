
----------Queries used in the transformations---------------------


MD5(FIRST_NAME||
LAST_NAME||
EMAIL||
PHONE_NUMBER||
HIRE_DATE||
JOB_ID||
SALARY||
COMMISSION_PCT||
MANAGER_ID||
DEPARTMENT_ID
) --------------- Exp calculating checksum



DECODE(TRUE,
ISNULL(TGT_EMPLOYEE_ID1),'I',
NOT ISNULL(TGT_EMPLOYEE_ID1) AND SRC_CHECKSUM_VAR!=TGT_CHECKSUM_VAL, 'U',
NOT ISNULL(TGT_EMPLOYEE_ID1) AND SRC_CHECKSUM_VAR=TGT_CHECKSUM_VAL, 'F'
) -------------Exp cmp variable port



OUT_FLAG = 'I' OR OUT_FLAG='U' -------------filter



DECODE(TRUE,
OUT_FLAG = 'I', DD_INSERT,
OUT_FLAG = 'U', DD_UPDATE
)------------update strategy