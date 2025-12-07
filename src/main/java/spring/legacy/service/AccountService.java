package spring.legacy.service;

import org.springframework.stereotype.Service;

@Service
public class AccountService {

    //private final AccountMapper accountMapper;
    //
    //public AccountService(AccountMapper accountMapper) {
    //    this.accountMapper = accountMapper;
    //}

    public boolean isEmailExists(String email) {
        System.out.println("서비스 들어오나");
        //return accountMapper.isEmailExists(email);
        return false;
    }
}
