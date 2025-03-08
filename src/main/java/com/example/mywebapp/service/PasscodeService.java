package com.example.mywebapp.service;

import com.example.mywebapp.model.Passcode;
import com.example.mywebapp.repository.PasscodeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class PasscodeService {

    @Autowired
    private PasscodeRepository PasscodeRepository;

    // Save Passcode
    public Passcode savePasscode(Passcode Passcode) {
        return PasscodeRepository.save(Passcode);
    }

    // Get all Passcodes
    public List<Passcode> getAllPasscodes() {
        return PasscodeRepository.findAll();
    }

    // Get Passcode by id
    public Optional<Passcode> getPasscodeById(Integer id) {
        return PasscodeRepository.findById(id);
    }

    // Update Passcode
    public Passcode updatePasscode(Integer id, Passcode updatedPasscode) {
        return PasscodeRepository.findById(id).map(existing -> {
            existing.setPass(updatedPasscode.getPass());
            return PasscodeRepository.save(existing);
        }).orElse(null);  // handle not found case if needed
    }

    // Delete Passcode
    public void deletePasscode(Integer id) {
        PasscodeRepository.deleteById(id);
    }
        public List<Passcode> getAllPasscodesDesc() {
        return PasscodeRepository.findAllByOrderByIdDesc();
    }
}
