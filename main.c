#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

size_t ft_strlen(const char *s);
char *ft_strcpy(char *dest, const char *src);
int ft_strcmp(const char *s1, const char *s2);
ssize_t ft_write(int fd, const void *buf, size_t count);
ssize_t ft_read(int fd, void *buf, size_t count);
char *ft_strdup(const char *s);

int main() {
    // Tests
    printf("strlen: %zu\n", strlen("Hello, world!"));
    printf("ft_strlen: %zu\n", ft_strlen("Hello, world!"));
    printf("--------------");
    char dest[50];
    printf("\nstrcpy: %s\n", strcpy(dest, "Test!"));
    printf("ft_strcpy: %s\n", ft_strcpy(dest, "Test!"));
    printf("-------------------------\n");
    printf("strcmp: %d\n", strcmp("abc", "abd"));
    printf("ft_strcmp: %d\n", ft_strcmp("abc", "abd"));
    printf("-------------------------\n");
    write(1, "write test\n", 11);
    ft_write(1, "ft_write test\n", 14);

    char buf[20];
    ft_read(0, buf, 5);
    buf[5] = '\0';
    printf("ft_read: %s\n", buf);
    printf("-------------------------\n");
    printf("strdup: %s\n", strdup("Duplicate me!"));
    char *dup = ft_strdup("Duplicate me!");
    printf("ft_strdup: %s\n", dup);
    free(dup);
    return 0;
}
