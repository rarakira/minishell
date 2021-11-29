include makefile.srcs

NAME		= minishell

SRCS_DIR	= srcs

OBJS_DIR	= objs

OBJS		= ${addprefix ${OBJS_DIR}/, ${SRCS:.c=.o}}

LIBS		= libs/libft/libft.a

INC_LIBS	= $(addprefix -L, $(dir ${LIBS})) -lft

INC_HEADERS	= -Iheaders $(addprefix -I, $(dir ${LIBS}))

CC			= cc

CFLAGS		= -Wall -Wextra -Werror

OPTFLAGS	= -O3 -MMD -MP

RM			= rm -rf


all:		$(dir ${LIBS}) ${NAME}

${NAME}:	${OBJS} ${LIBS}
			${CC} ${CFLAGS} ${OBJS} -o ${NAME} ${INC_LIBS}

.SECONDEXPANSION:
${OBJS}:	$$(patsubst %.o, %.c, $$(subst ${OBJS_DIR}/, ${SRCS_DIR}/, $${@}))
			@mkdir -p ${@D}
			${CC} ${CFLAGS} ${OPTFLAGS} ${INC_HEADERS} -c $< -o $@

$(dir ${LIBS}):
			@make -C $@ $(MAKECMDGOALS)

clean:		$(dir ${LIBS})
			${RM} ${OBJS_DIR}

fclean:		$(dir ${LIBS})
			${RM} ${OBJS_DIR} ${NAME}

re:			fclean all

.PHONY: all $(dir ${LIBS}) clean fclean re

-include ${OBJS:.o=.d}
