/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   unset_env.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: cflorind <marvin@42.fr>                    +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2021/12/06 23:02:46 by cflorind          #+#    #+#             */
/*   Updated: 2022/01/11 15:14:28 by cflorind         ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"
#include "bool.h"
#include "builtins.h"

void	unset_env(char *name, char **env)
{
	int		i;
	char	*tmp;

	name = ft_strjoinchr(name, '=');
	if (name == NULL)
		return ;
	i = 0;
	while (env[i] && ft_strcmp(env[i], name) != 0)
		i++;
	free(name);
	if (env[i] == NULL)
		return ;
	tmp = env[i];
	while (env[i])
	{
		env[i] = env[i + 1];
		i++;
	}
	free(tmp);
}
