package duyeo;

import java.sql.Date;

public class GatherArticleDTO {
	private String bbs_id;
	private String writer;
	private String subject;
	private String contents;
	private String gameid;
	private String gametag;
	private String entered;
	private Date posted_date;
	private Date update_date;
	private Date delete_date;
	private Date exp_date;
	private String delete_at;
	private int min_player;
	private int max_player;
	private int readcount;
	private int liked;
	
	public String getBbs_id() {
		return bbs_id;
	}
	public void setBbs_id(String bbs_id) {
		this.bbs_id = bbs_id;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getGameid() {
		return gameid;
	}
	public void setGameid(String gameid) {
		this.gameid = gameid;
	}
	public String getGametag() {
		return gametag;
	}
	public void setGametag(String gametag) {
		this.gametag = gametag;
	}
	public String getEntered() {
		return entered;
	}
	public void setEntered(String entered) {
		this.entered = entered;
	}
	public Date getPosted_date() {
		return posted_date;
	}
	public void setPosted_date(Date posted_date) {
		this.posted_date = posted_date;
	}
	public Date getUpdate_date() {
		return update_date;
	}
	public void setUpdate_date(Date update_date) {
		this.update_date = update_date;
	}
	public Date getDelete_date() {
		return delete_date;
	}
	public void setDelete_date(Date delete_date) {
		this.delete_date = delete_date;
	}
	public Date getExp_date() {
		return exp_date;
	}
	public void setExp_date(Date exp_date) {
		this.exp_date = exp_date;
	}
	public String getDelete_at() {
		return delete_at;
	}
	public void setDelete_at(String delete_at) {
		this.delete_at = delete_at;
	}
	public int getMin_player() {
		return min_player;
	}
	public void setMin_player(int min_player) {
		this.min_player = min_player;
	}
	public int getMax_player() {
		return max_player;
	}
	public void setMax_player(int max_player) {
		this.max_player = max_player;
	}
	public int getReadcount() {
		return readcount;
	}
	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	public int getLiked() {
		return liked;
	}
	public void setLiked(int liked) {
		this.liked = liked;
	}
	@Override
	public String toString() {
		return "GatherArticleDTO [bbs_id=" + bbs_id + ", writer=" + writer + ", subject=" + subject + ", contents="
				+ contents + ", gameid=" + gameid + ", gametag=" + gametag + ", entered=" + entered + ", posted_date="
				+ posted_date + ", update_date=" + update_date + ", delete_date=" + delete_date + ", exp_date="
				+ exp_date + ", delete_at=" + delete_at + ", min_player=" + min_player + ", max_player=" + max_player
				+ ", readcount=" + readcount + ", liked=" + liked + "]";
	}
	public GatherArticleDTO(String bbs_id, String writer, String subject, String contents, String gameid,
			String gametag, String entered, Date posted_date, Date update_date, Date delete_date, Date exp_date,
			String delete_at, int min_player, int max_player, int readcount, int liked) {
		this.bbs_id = bbs_id;
		this.writer = writer;
		this.subject = subject;
		this.contents = contents;
		this.gameid = gameid;
		this.gametag = gametag;
		this.entered = entered;
		this.posted_date = posted_date;
		this.update_date = update_date;
		this.delete_date = delete_date;
		this.exp_date = exp_date;
		this.delete_at = delete_at;
		this.min_player = min_player;
		this.max_player = max_player;
		this.readcount = readcount;
		this.liked = liked;
	}
	public GatherArticleDTO() {
	}
	
}