package model.bo;

import model.bean.RegistrationProfile;
import model.dao.RegistrationProfileDAO;

import java.util.List;

public class RegistrationProfileBO {

    private final RegistrationProfileDAO registrationProfileDAO;

    public RegistrationProfileBO() {
        this.registrationProfileDAO = new RegistrationProfileDAO();
    }

    // Add a new registration profile
    public boolean addRegistrationProfile(RegistrationProfile profile) {
        if (profile == null || profile.getId() == null || profile.getFullName() == null) {
            return false; // Basic validation
        }
        return registrationProfileDAO.addRegistrationProfile(profile);
    }

    // Get a specific registration profile by ID
    public RegistrationProfile getRegistrationProfile(String id) {
        if (id == null || id.isEmpty()) {
            return null;
        }
        return registrationProfileDAO.getRegistrationProfile(id);
    }

    // Get all registration profiles
    public List<RegistrationProfile> getAllRegistrationProfiles() {
        return registrationProfileDAO.getAllRegistrationProfiles();
    }

    // Update an existing registration profile
    public boolean updateRegistrationProfile(RegistrationProfile profile) {
        if (profile == null || profile.getId() == null) {
            return false; // Basic validation
        }
        return registrationProfileDAO.updateRegistrationProfile(profile);
    }

    // Delete a registration profile by ID
    public boolean deleteRegistrationProfile(String id) {
        if (id == null || id.isEmpty()) {
            return false;
        }
        return registrationProfileDAO.deleteRegistrationProfile(id);
    }
    public List<RegistrationProfile> SearchProfileBO(String query){
    	return registrationProfileDAO.searchProfiles(query);
    }
    public List<RegistrationProfile> getProfileByCourse(String id){
        return registrationProfileDAO.getProfilesByCourse(id);
    }
    public List<RegistrationProfile> getRegistrationProfilesByUserIdBO(String userId){
    	return registrationProfileDAO.getRegistrationProfilesByUserId(userId);
    }
}