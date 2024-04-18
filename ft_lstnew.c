/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_lstnew.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: rjaada <rjaada@student.42.fr>              +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/04/17 18:01:47 by rjaada            #+#    #+#             */
/*   Updated: 2024/04/17 18:01:49 by rjaada           ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "push_swap.h"

	/*
	Creates a new node for a linked list with the given integer value.
	Allocates memory for the new node using malloc and sets the initial
	values for the node's value, index, and next pointer.
	-1 to represent an unset or invalid index value.
	Returns a pointer to the newly created node.
	*/

t_list	*ft_lstnew(int value)
{
	t_list	*new;

	new = (t_list *) malloc(sizeof(*new));
	if (!new)
		return (NULL);
	new->value = value;
	new->index = -1;
	new->next = NULL;
	return (new);
}
