package iset.project.exchange.repository;

import java.util.Optional;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.mongodb.repository.MongoRepository;

import iset.project.exchange.entities.UserAuth;

public interface UserAuthRepository extends MongoRepository<UserAuth, String>{
	@Query(" select u from UserAuth u where u.username = ?1")
	Optional<UserAuth> findByUsername(String username);
}
