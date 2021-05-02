package gallery;

public class Gallery {
	
	private int galleryId;
	private String userId;
	private String galleryDate;	
	private String galleryTitle;
	private String galleryContent;
	private String galleryImagename;
	private int galleryAvailable;
	
	public Gallery() {
	}
	public int getGalleryId() {
		return galleryId;
	}
	public void setGalleryId(int galleryId) {
		this.galleryId = galleryId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getGalleryDate() {
		return galleryDate;
	}
	public void setGalleryDate(String galleryDate) {
		this.galleryDate = galleryDate;
	}
	public String getGalleryTitle() {
		return galleryTitle;
	}
	public void setGalleryTitle(String galleryTitle) {
		this.galleryTitle = galleryTitle;
	}
	public String getGalleryContent() {
		return galleryContent;
	}
	public void setGalleryContent(String galleryContent) {
		this.galleryContent = galleryContent;
	}
	public String getGalleryImagename() {
		return galleryImagename;
	}
	public void setGalleryImagename(String galleryImagename) {
		this.galleryImagename = galleryImagename;
	}
	public int getGalleryAvailable() {
		return galleryAvailable;
	}
	public void setGalleryAvailable(int galleryAvailable) {
		this.galleryAvailable = galleryAvailable;
	}
	
}
