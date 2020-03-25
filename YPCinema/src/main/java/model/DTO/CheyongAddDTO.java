package model.DTO;

import java.io.Serializable;
import java.util.Date;

@SuppressWarnings("serial")
public class CheyongAddDTO implements Serializable{
	private String che_num;
	private String che_subject;
	private String che_jijom;
	private String che_person;
	private String che_jogun;
	private String che_bocri;
	private String che_jagyuc;
	private String che_gita;
	private String che_sijac_string;
	private String che_magam_string;
	private Date che_sijac;
	private Date che_magam;
	public String getChe_num() {
		return che_num;
	}
	public void setChe_num(String che_num) {
		this.che_num = che_num;
	}
	public String getChe_subject() {
		return che_subject;
	}
	public void setChe_subject(String che_subject) {
		this.che_subject = che_subject;
	}
	public String getChe_jijom() {
		return che_jijom;
	}
	public void setChe_jijom(String che_jijom) {
		this.che_jijom = che_jijom;
	}
	public String getChe_person() {
		return che_person;
	}
	public void setChe_person(String che_person) {
		this.che_person = che_person;
	}
	public String getChe_jogun() {
		return che_jogun;
	}
	public void setChe_jogun(String che_jogun) {
		this.che_jogun = che_jogun;
	}
	public String getChe_bocri() {
		return che_bocri;
	}
	public void setChe_bocri(String che_bocri) {
		this.che_bocri = che_bocri;
	}
	public String getChe_jagyuc() {
		return che_jagyuc;
	}
	public void setChe_jagyuc(String che_jagyuc) {
		this.che_jagyuc = che_jagyuc;
	}
	public String getChe_gita() {
		return che_gita;
	}
	public void setChe_gita(String che_gita) {
		this.che_gita = che_gita;
	}
	public String getChe_sijac_string() {
		return che_sijac_string;
	}
	public void setChe_sijac_string(String che_sijac_string) {
		this.che_sijac_string = che_sijac_string;
	}
	public String getChe_magam_string() {
		return che_magam_string;
	}
	public void setChe_magam_string(String che_magam_string) {
		this.che_magam_string = che_magam_string;
	}
	public Date getChe_sijac() {
		return che_sijac;
	}
	public void setChe_sijac(Date che_sijac) {
		this.che_sijac = che_sijac;
	}
	public Date getChe_magam() {
		return che_magam;
	}
	public void setChe_magam(Date che_magam) {
		this.che_magam = che_magam;
	}

}
