# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: rjaada <rjaada@student.42.fr>              +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2024/04/17 17:26:41 by rjaada            #+#    #+#              #
#    Updated: 2024/04/17 18:24:15 by rjaada           ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

# BASIC
CC = cc -g
CFLAGS = -Wall -Wextra -Werror -g3
RM = rm -rf
GDB = gdb
VAL = valgrind --leak-check=full --track-origin=yes

#colors
RESET			:= \033[0m
GREEN			=	\e[32m
CYAN			:= \33[1;36m
YELLOW			=	\e[033m
BLUE			=	\e[34m
WHITE			=	\e[00m
RED				:= \033[1;31m
BOLD			:= \033[1;1m

# PUSH_SWAP
NAME = push_swap.a
SRCS =  ./sort_small.c \
        ./sort_simple.c \
        ./sort_radix.c \
        ./ft_atoi.c \
        ./ft_isdigit.c \
        ./ft_lstadd_back.c \
        ./ft_lstadd_front.c \
        ./ft_lstlast.c \
        ./ft_lstnew.c \
        ./ft_lstsize.c \
        ./ft_memcpy.c \
        ./ft_split.c \
        ./ft_strchr.c \
        ./ft_strdup.c \
        ./ft_substr.c \
        ./push.c \
        ./reverse.c \
        ./rotate.c \
        ./swap.c \
        ./error.c \
        ./utilities.c \
        ./validation.c \
        ./push_swap.c

OBJSDIR = objects
OBJS = $(addprefix $(OBJSDIR)/,$(SRCS:.c=.o))

# MAKE RULES
all: $(NAME) push_swap

$(NAME): $(OBJS)
	@echo "$(GREEN)$(BOLD)Creating objects directory...$(RESET)"
	ar -rcs $(NAME) $(OBJS)
	@echo "$(GREEN)$(BOLD)Objects created!$(RESET)"
	
$(OBJSDIR)/%.o: %.c
	mkdir -p $(@D)
	$(CC) $(CFLAGS) -c $< -o $@

push_swap: $(PUSH_SWAP_OBJ) $(NAME)
	@echo "$(GREEN)$(BOLD)Creating executable...$(RESET)"
	$(CC) $(CFLAGS) $(PUSH_SWAP_OBJ) $(NAME) -o push_swap
	@echo "$(GREEN)$(BOLD)Executable created!$(RESET)"

clean:
	@echo "$(YELLOW)$(BOLD)Removing objects...$(RESET)"
	$(RM) $(OBJSDIR)
	@echo "$(YELLOW)$(BOLD)Objects removed!$(RESET)"

fclean: clean
	@echo "$(RED)$(BOLD)Removing executable...$(RESET)"
	$(RM) push_swap push_swap.a
	@echo "$(RED)$(BOLD)Executable removed!$(RESET)"

re: fclean all
	@echo "$(GREEN)$(BOLD)Recompiled successfully!$(RESET)"

.SILENT:
