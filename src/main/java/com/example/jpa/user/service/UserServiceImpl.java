package com.example.jpa.user.service;

import com.example.jpa.board.entity.BoardBookmark;
import com.example.jpa.board.model.ServiceResult;
import com.example.jpa.user.entity.User;
import com.example.jpa.user.entity.UserInterest;
import com.example.jpa.user.model.UserLogCount;
import com.example.jpa.user.model.UserNoticeCount;
import com.example.jpa.user.model.UserStatus;
import com.example.jpa.user.model.UserSummary;
import com.example.jpa.user.repository.UserCustomRepository;
import com.example.jpa.user.repository.UserInterestRepository;
import com.example.jpa.user.repository.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.time.LocalDateTime;
import java.util.List;
import java.util.Optional;

@RequiredArgsConstructor
@Service
public class UserServiceImpl implements UserService{

    private final UserRepository userRepository;
    private final UserCustomRepository userCustomRepository;
    private final UserInterestRepository userInterestRepository;

    @Override
    public UserSummary getUserStatusCount() {

        long usingUserCount = userRepository.countByStatus(UserStatus.Using);
        long stopUserCount = userRepository.countByStatus(UserStatus.Stop);
        long noneUserCount = userRepository.countByStatus(UserStatus.None);

        long totalUserCount = userRepository.count();

        return UserSummary.builder()
                .usingUserCount(usingUserCount)
                .stopUserCount(stopUserCount)
                .noneUserCount(noneUserCount)
                .build();

    }

    @Override
    public List<User> getTodayUsers() {

        LocalDateTime t = LocalDateTime.now();
        LocalDateTime startDate = LocalDateTime.of(t.getYear(), t.getMonth(), t.getDayOfMonth(), 0, 0);
        LocalDateTime endDate = startDate.plusDays(1);

        return userRepository.findToday(startDate, endDate);
    }

    @Override
    public List<UserNoticeCount> getUserNoticeCount() {

        return userCustomRepository.findUserNoticeCount();
    }

    @Override
    public List<UserLogCount> getUserLogCount() {

        return userCustomRepository.findUserLogCount();
    }

    @Override
    public List<UserLogCount> getLikeBestUser() {
        return userCustomRepository.findUserLikeBest();
    }

    @Override
    public ServiceResult addInterestUser(String email, Long id) {

        Optional<User> optionalUser = userRepository.findByEmail(email);
        if (!optionalUser.isPresent()) {
            return ServiceResult.fail("??????????????? ???????????? ????????????.");
        }
        User user = optionalUser.get();

        Optional<User> optionalInterestUser = userRepository.findById(id);
        if (!optionalInterestUser.isPresent()) {
            return ServiceResult.fail("?????????????????? ????????? ??????????????? ???????????? ????????????.");
        }
        User interestUser = optionalInterestUser.get();

        // ??? ????????? ????????????
        if (user.getId() == interestUser.getId()) {
            return ServiceResult.fail("??????????????? ????????? ??? ????????????.");
        }

        if (userInterestRepository.countByUserAndInterestUser(user, interestUser) > 0) {
            return ServiceResult.fail("?????? ??????????????? ????????? ?????????????????????.");
        }

        UserInterest userInterest = UserInterest.builder()
                .user(user)
                .interestUser(interestUser)
                .regDate(LocalDateTime.now())
                .build();
        userInterestRepository.save(userInterest);

        return ServiceResult.success();
    }

    @Override
    public ServiceResult removeInterestUser(String email, Long interestId) {
        Optional<User> optionalUser = userRepository.findByEmail(email);
        if (!optionalUser.isPresent()) {
            return ServiceResult.fail("??????????????? ???????????? ????????????.");
        }
        User user = optionalUser.get();

        Optional<UserInterest> optionalInterestUser = userInterestRepository.findById(interestId);
        if (!optionalInterestUser.isPresent()) {
            return ServiceResult.fail("????????? ????????? ????????????.");
        }
        UserInterest userInterest = optionalInterestUser.get();

        if (userInterest.getUser().getId() != user.getId()) {
            return ServiceResult.fail("????????? ????????? ????????? ????????? ??? ????????????.");
        }
        userInterestRepository.delete(userInterest);
        return ServiceResult.success();
    }
}
