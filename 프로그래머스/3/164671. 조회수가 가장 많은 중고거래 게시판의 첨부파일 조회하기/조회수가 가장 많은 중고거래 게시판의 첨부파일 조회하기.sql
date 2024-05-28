# SELECT 
#     CASE
#     WHEN FILE_ID IS NOT NULL THEN CONCAT("/home/grep/src/", BOARD_ID, "/", FILE_ID, FILE_NAME, FILE_EXT)
#     ELSE 0
#     END AS FILE_PATH
# FROM USED_GOODS_FILE 
# WHERE BOARD_ID IN (
#         SELECT BOARD_ID
#         FROM USED_GOODS_BOARD
#         ORDER BY VIEWS
#         LIMIT 1)
# ORDER BY FILE_ID

SELECT 
    CASE
    WHEN FILE_ID IS NOT NULL THEN CONCAT("/home/grep/src/", F.BOARD_ID, "/", FILE_ID, FILE_NAME, FILE_EXT)
    ELSE 0
    END AS FILE_PATH
FROM USED_GOODS_FILE AS F
JOIN (SELECT BOARD_ID
        FROM USED_GOODS_BOARD
        ORDER BY VIEWS DESC
        LIMIT 1) AS B
ON F.BOARD_ID = B.BOARD_ID
ORDER BY FILE_ID DESC

# SELECT F.FILE_ID, F.BOARD_ID
# FROM USED_GOODS_FILE AS F
# JOIN (SELECT BOARD_ID
#         FROM USED_GOODS_BOARD
#         ORDER BY VIEWS DESC
#         LIMIT 1) AS B
# ON F.BOARD_ID = B.BOARD_ID
# ORDER BY FILE_ID


        