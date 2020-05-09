package cn.blog.pojo;

import java.io.Serializable;
import java.util.Date;
import java.util.List;
/**
 * 侧边栏
 * @author Magic
 *
 */
public class Menu implements Serializable{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	//主键
    private Integer id;
    //名字
    private String name;
    //父id
    private Integer parentId;
    //创建时间
    private Date createTime;
    //排序
    private Integer sort;
    //链接
    private String url;
    //图标
    private String icon;
    //目录集合
    private List<Menu> listMenu;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Integer getParentId() {
		return parentId;
	}
	public void setParentId(Integer parentId) {
		this.parentId = parentId;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public Integer getSort() {
		return sort;
	}
	public void setSort(Integer sort) {
		this.sort = sort;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getIcon() {
		return icon;
	}
	public void setIcon(String icon) {
		this.icon = icon;
	}
	public List<Menu> getListMenu() {
		return listMenu;
	}
	public void setListMenu(List<Menu> listMenu) {
		this.listMenu = listMenu;
	}
    

	
}