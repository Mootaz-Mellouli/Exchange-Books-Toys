package iset.project.exchange.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;

import iset.project.exchange.entities.Role;

@Repository
public interface RoleRepository extends MongoRepository<Role, Integer>{

}
