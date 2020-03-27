package model.DTO;

import java.io.Serializable;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

@SuppressWarnings("serial")
public class CompanyDTO implements Serializable {
	private String c_num;
	private String c_companynum;
	private String c_id;
	private String c_pass;
	private String c_pass_con;
	private String c_picture;
	private String c_class;
	private String c_name;
	private String c_ceoname;
	private String c_comname;
	private String c_gen;
	@DateTimeFormat(pattern = "yyyy-MM-dd") // 요런식으로.. 간단하게 포맷 설정..
	private Date c_birth;
	private String c_ceoph;
	private String c_comph;
	private String c_addr1;
	private String c_addr2;
	private String c_comaddr;
	private String c_comaddr2;
	private String c_ceoaddr;
	private String c_ceoaddr2;
	private String c_zip;
	private String c_zip1;
	private String c_email;
	private String c_yc;
	private String c_cc;
	@DateTimeFormat(pattern = "yyyy-MM-dd") // 요런식으로.. 간단하게 포맷 설정..
	private Date c_date;
	private String c_admin;

	public String getC_num() {
		return c_num;
	}

	public void setC_num(String c_num) {
		this.c_num = c_num;
	}

	public String getC_companynum() {
		return c_companynum;
	}

	public void setC_companynum(String c_companynum) {
		this.c_companynum = c_companynum;
	}

	public String getC_id() {
		return c_id;
	}

	public void setC_id(String c_id) {
		this.c_id = c_id;
	}

	public String getC_pass() {
		return c_pass;
	}

	public void setC_pass(String c_pass) {
		this.c_pass = c_pass;
	}

	public String getC_pass_con() {
		return c_pass_con;
	}

	public void setC_pass_con(String c_pass_con) {
		this.c_pass_con = c_pass_con;
	}

	public String getC_picture() {
		return c_picture;
	}

	public void setC_picture(String c_picture) {
		this.c_picture = c_picture;
	}

	public String getC_class() {
		return c_class;
	}

	public void setC_class(String c_class) {
		this.c_class = c_class;
	}

	public String getC_name() {
		return c_name;
	}

	public void setC_name(String c_name) {
		this.c_name = c_name;
	}

	public String getC_ceoname() {
		return c_ceoname;
	}

	public void setC_ceoname(String c_ceoname) {
		this.c_ceoname = c_ceoname;
	}

	public String getC_comname() {
		return c_comname;
	}

	public void setC_comname(String c_comname) {
		this.c_comname = c_comname;
	}

	public String getC_gen() {
		return c_gen;
	}

	public void setC_gen(String c_gen) {
		this.c_gen = c_gen;
	}

	public Date getC_birth() {
		return c_birth;
	}

	public void setC_birth(Date c_birth) {
		this.c_birth = c_birth;
	}

	public String getC_ceoph() {
		return c_ceoph;
	}

	public void setC_ceoph(String c_ceoph) {
		this.c_ceoph = c_ceoph;
	}

	public String getC_comph() {
		return c_comph;
	}

	public void setC_comph(String c_comph) {
		this.c_comph = c_comph;
	}

	public String getC_addr1() {
		return c_addr1;
	}

	public void setC_addr1(String c_addr1) {
		this.c_addr1 = c_addr1;
	}

	public String getC_addr2() {
		return c_addr2;
	}

	public void setC_addr2(String c_addr2) {
		this.c_addr2 = c_addr2;
	}

	public String getC_comaddr() {
		return c_comaddr;
	}

	public void setC_comaddr(String c_comaddr) {
		this.c_comaddr = c_comaddr;
	}

	public String getC_comaddr2() {
		return c_comaddr2;
	}

	public void setC_comaddr2(String c_comaddr2) {
		this.c_comaddr2 = c_comaddr2;
	}

	public String getC_ceoaddr() {
		return c_ceoaddr;
	}

	public void setC_ceoaddr(String c_ceoaddr) {
		this.c_ceoaddr = c_ceoaddr;
	}

	public String getC_ceoaddr2() {
		return c_ceoaddr2;
	}

	public void setC_ceoaddr2(String c_ceoaddr2) {
		this.c_ceoaddr2 = c_ceoaddr2;
	}

	public String getC_zip() {
		return c_zip;
	}

	public void setC_zip(String c_zip) {
		this.c_zip = c_zip;
	}

	public String getC_zip1() {
		return c_zip1;
	}

	public void setC_zip1(String c_zip1) {
		this.c_zip1 = c_zip1;
	}

	public String getC_email() {
		return c_email;
	}

	public void setC_email(String c_email) {
		this.c_email = c_email;
	}

	public String getC_yc() {
		return c_yc;
	}

	public void setC_yc(String c_yc) {
		this.c_yc = c_yc;
	}

	public String getC_cc() {
		return c_cc;
	}

	public void setC_cc(String c_cc) {
		this.c_cc = c_cc;
	}

	public Date getC_date() {
		return c_date;
	}

	public void setC_date(Date c_date) {
		this.c_date = c_date;
	}

	public String getC_admin() {
		return c_admin;
	}

	public void setC_admin(String c_admin) {
		this.c_admin = c_admin;
	}

}
