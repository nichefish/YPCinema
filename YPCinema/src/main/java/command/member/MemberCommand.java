package command.member;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class MemberCommand {
	private String m_num;
	private String m_id;
	private String m_pass;
	private String m_pass_con;
	private String m_picture;
	private String m_class;
	private String m_name;
	private String m_gen;
	@DateTimeFormat(pattern="yyyy-MM-dd")		// 요런식으로.. 간단하게 포맷 설정..
	private Date m_birth;
	private String m_ph;
	private String m_addr1;
	private String m_addr2;
	private String m_zip;
	private String m_email;
	private String m_yc;
	private String m_cc;
	@DateTimeFormat(pattern="yyyy-MM-dd")		// 요런식으로.. 간단하게 포맷 설정..
	private Date m_date;
	private String m_admin;
	
	public String getM_num() {
		return m_num;
	}
	public void setM_num(String m_num) {
		this.m_num = m_num;
	}
	public String getM_id() {
		return m_id;
	}
	public void setM_id(String m_id) {
		this.m_id = m_id;
	}
	public String getM_pass() {
		return m_pass;
	}
	public void setM_pass(String m_pass) {
		this.m_pass = m_pass;
	}
	public String getM_pass_con() {
		return m_pass_con;
	}
	public void setM_pass_con(String m_pass_con) {
		this.m_pass_con = m_pass_con;
	}
	public String getM_picture() {
		return m_picture;
	}
	public void setM_picture(String m_picture) {
		this.m_picture = m_picture;
	}
	public String getM_class() {
		return m_class;
	}
	public void setM_class(String m_class) {
		this.m_class = m_class;
	}
	public String getM_name() {
		return m_name;
	}
	public void setM_name(String m_name) {
		this.m_name = m_name;
	}
	public String getM_gen() {
		return m_gen;
	}
	public void setM_gen(String m_gen) {
		this.m_gen = m_gen;
	}
	public Date getM_birth() {
		return m_birth;
	}
	public void setM_birth(Date m_birth) {
		this.m_birth = m_birth;
	}
	public String getM_ph() {
		return m_ph;
	}
	public void setM_ph(String m_ph) {
		this.m_ph = m_ph;
	}
	public String getM_addr1() {
		return m_addr1;
	}
	public void setM_addr1(String m_addr1) {
		this.m_addr1 = m_addr1;
	}
	public String getM_addr2() {
		return m_addr2;
	}
	public void setM_addr2(String m_addr2) {
		this.m_addr2 = m_addr2;
	}
	public String getM_zip() {
		return m_zip;
	}
	public void setM_zip(String m_zip) {
		this.m_zip = m_zip;
	}
	public String getM_email() {
		return m_email;
	}
	public void setM_email(String m_email) {
		this.m_email = m_email;
	}
	public String getM_yc() {
		return m_yc;
	}
	public void setM_yc(String m_yc) {
		this.m_yc = m_yc;
	}
	public String getM_cc() {
		return m_cc;
	}
	public void setM_cc(String m_cc) {
		this.m_cc = m_cc;
	}
	public Date getM_date() {
		return m_date;
	}
	public void setM_date(Date m_date) {
		this.m_date = m_date;
	}
	public String getM_admin() {
		return m_admin;
	}
	public void setM_admin(String m_admin) {
		this.m_admin = m_admin;
	}
}
