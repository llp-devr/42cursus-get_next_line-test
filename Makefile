SRC = ./main.c \
      ./unity.c \
      ./get_next_line/get_next_line.c \
      ./get_next_line/get_next_line_utils.c

OBJ = $(SRC:%.c=%.o)

CC = cc

BUFFER_SIZE ?= 1024

CFLAGS += -Wall -Werror -Wextra -DBUFFER_SIZE=$(BUFFER_SIZE)

NAME = get_next_line-test

$(NAME): $(OBJ)
	$(CC) $(CFLAGS) -o $(NAME) $(OBJ)

all: $(NAME)

clean:
	rm -f $(OBJ)

fclean: clean
	rm -f $(NAME)

test: all
	exec valgrind --quiet --leak-check=full --track-origins=yes $(realpath $(NAME))

.PHONY: all clean fclean test

