package diary;

public class Diary {
		private int diaryNo;
		private String diaryTitle;
		private String userID;
		private String diaryDate;
		private String diaryContent;
		private int diaryAvailable;
		
		public String getDiaryTitle() {
			return diaryTitle;
		}
		public void setDiaryTitle(String diaryTitle) {
			this.diaryTitle = diaryTitle;
		}
		public int getDiaryNo() {
			return diaryNo;
		}
		public void setDiaryNo(int diaryNo) {
			this.diaryNo = diaryNo;
		}
		public String getUserID() {
			return userID;
		}
		public void setUserID(String userID) {
			this.userID = userID;
		}
		
		public String getDiaryContent() {
			return diaryContent;
		}
		public void setDiaryContent(String diaryContent) {
			this.diaryContent = diaryContent;
		}
		public int getDiaryAvailable() {
			return diaryAvailable;
		}
		public void setDiaryAvailable(int diaryAvailable) {
			this.diaryAvailable = diaryAvailable;
		}
		public String getDiaryDate() {
			return diaryDate;
		}
		public void setDiaryDate(String diaryDate) {
			this.diaryDate = diaryDate;
		}
		
}