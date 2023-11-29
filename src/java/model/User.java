/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

import java.util.Date;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

/**
 *
 * @author Admin
 */
@ToString
@Builder
@Data
@AllArgsConstructor
@NoArgsConstructor
@Getter
@Setter
public class User {

    private int id;
    private String password;
    private String email;
    private String fullname;
    private String phone_number;
    private String avatar;
    private boolean status;
    private Date register_at;
    private int created_by;
    private int updated_by;
    private Date updated_at;
    private Setting role;

    public User(int id, String fullname) {
        this.id = id;
        this.fullname = fullname;
    }
}
