//===----------------------------------------------------------------------===//
//
//                         Peloton
//
// main.cpp
//
// Identification: src/main.cpp
//
// Copyright (c) 2015-16, Carnegie Mellon University Database Group
//
//===----------------------------------------------------------------------===//

#include <stdio.h>
#include <stdlib.h>

#include "parser/pg_query.h"

size_t testCount = 7;
const char* tests[] = {
    "SELECT 1",
    "SELECT * FROM x WHERE z = 2",
    "SELECT 5.41414",
    "SELECT $1",
    "SELECT ?",
    "SELECT 999999999999999999999::numeric/1000000000000000000000",
    "SELECT 4790999999999999999999999999999999999999999999999999999999999999999999999999999999999999 * 9999999999999999999999999999999999999999999999999999999999999999999999999999999999999999"
};

int main() {
  PgQueryParseResult result;
  size_t i;

  pg_query_init();

  // TEST CASES
  for (i = 0; i < testCount; i++) {
    result = pg_query_parse(tests[i]);

    if (result.error) {
      printf("error: %s at %d\n", result.error->message, result.error->cursorpos);
    } else {
      printf("%s\n", result.parse_tree);
    }

    pg_query_free_parse_result(result);
  }

  // ERROR
  result = pg_query_parse("INSERT FROM DOES NOT WORK");

  if (result.error) {
    printf("error: %s at location %d (%s:%d)\n", result.error->message,
           result.error->cursorpos, result.error->filename, result.error->lineno);
  } else {
    printf("%s\n", result.parse_tree);
  }

  pg_query_free_parse_result(result);



  return 0;
}
