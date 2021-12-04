project(package_that_succeeds)

cmake_minimum_required(VERSION 3.5)

add_executable(greeting src/greeting)

install(
  TARGETS greeting
  RUNTIME DESTINATION bin
)
