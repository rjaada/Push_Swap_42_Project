/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_memcpy.c                                        :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: rjaada <rjaada@student.42.fr>              +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2024/04/17 18:02:53 by rjaada            #+#    #+#             */
/*   Updated: 2024/04/17 18:02:55 by rjaada           ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "push_swap.h"

	/*
	Copies n bytes from the memory area pointed to by src to the memory
	area pointed to by dest. It returns a pointer to the destination
	memory area. It works even if the memory areas overlap.
	*/

void	*ft_memcpy(void *dest, const void *src, size_t n)
{
	unsigned const char	*pt_src;
	unsigned char		*pt_dest;
	size_t				i;

	pt_dest = (unsigned char *)dest;
	pt_src = (unsigned char *)src;
	i = 0;
	if (dest == NULL && src == NULL)
		return (NULL);
	while (i < n)
	{
		*((char *)dest + i) = *((char *)pt_src + i);
		i++;
	}
	return (pt_dest);
}
