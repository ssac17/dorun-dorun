package spring.legacy.dto;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;

import java.util.Collection;

public class CustomUserDetails extends User {

    private final String name;

    public CustomUserDetails(AccountDto account, Collection<? extends GrantedAuthority> authorities) {
        super(account.getEmail(), account.getPassword(), authorities);
        this.name = account.getName();
    }

    public String getName() {
        return name;
    }
}
