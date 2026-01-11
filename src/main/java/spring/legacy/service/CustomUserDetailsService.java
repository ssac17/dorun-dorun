package spring.legacy.service;

import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import spring.legacy.dto.AccountDto;
import spring.legacy.dto.CustomUserDetails;
import spring.legacy.mapper.AccountMapper;

@Service
public class CustomUserDetailsService implements UserDetailsService {

    private final AccountMapper accountMapper;

    public CustomUserDetailsService(AccountMapper accountMapper) {
        this.accountMapper = accountMapper;
    }

    @Override
    public UserDetails loadUserByUsername(String email) throws UsernameNotFoundException {
        AccountDto account = accountMapper.findByEmail(email);
        if(account == null) {
            throw new UsernameNotFoundException("사용자를 찾을 수 없습니다: " + email);
        }

        return new CustomUserDetails(account, AuthorityUtils.createAuthorityList("ROLE_USER"));
    }
}
