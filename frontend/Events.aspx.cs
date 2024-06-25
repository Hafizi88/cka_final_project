using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Globalization;
using System.Text;
using System.IO;
using System.Net;

public partial class EventForm : System.Web.UI.Page
{
    string[] searchAcceptParameter = { "state", "party", "date", "keyword" };
    Dictionary<string, string> stateData = new Dictionary<string, string>();

    protected void Page_Load(object sender, EventArgs e)
    {
        //STATE
        DataSet dataState = new DataSet();
        dataState = getStateData();
        if (dataState != null)
        {
            state.DataTextField = dataState.Tables[0].Columns["StateDesc"].ToString();
            state.DataValueField = dataState.Tables[0].Columns["StateID"].ToString();
            state.DataSource = dataState.Tables[0];
            state.DataBind();
            for (int loopcounter = 0; loopcounter < dataState.Tables[0].Rows.Count; loopcounter++)
            {
                stateData["" + dataState.Tables[0].Rows[loopcounter]["StateID"].ToString()] = dataState.Tables[0].Rows[loopcounter]["StateDesc"].ToString();
            }
        }
        //END STATE

        //PARTY
        DataSet dataParty = new DataSet();
        dataParty = getPartyData();
        party.DataBind();
        ListItem newItem;
        DataTable dt = new DataTable();
        if (dataParty != null)
        {
            dt = dataParty.Tables[0];
            foreach (DataRow drow in dt.Rows)
            {
                newItem = new ListItem(drow["Party"].ToString(), drow["Party"].ToString());
                newItem.Attributes["data-category"] = drow["CoalitionName"].ToString();
                party.Items.Add(newItem);
            }
        }
        //END PARTY

        //DATE
        DataSet dataDate = new DataSet();
        dataDate = getDateData();
        date.DataBind();
        ListItem newItemDate;
        DataTable dtDate = new DataTable();
        if (dataDate != null)
        {
            dtDate = dataDate.Tables[0];
            foreach (DataRow drowD in dtDate.Rows)
            {
                newItemDate = new ListItem(drowD["date"].ToString(), drowD["date"].ToString());
                newItemDate.Attributes["data-category"] = drowD["date_parent"].ToString();
                date.Items.Add(newItemDate);
            }
        }
        //END DATE


        //SET DEFAULT VALUE
        if (Request.QueryString["keyword"] != null)
        {
            keyword.Text = Request.QueryString["keyword"];
        }

        if (Request.QueryString["state"] != null)
        {
            ListItem item = state.Items.FindByValue(Request.QueryString["state"]);
            if (item != null)
            {
                state.Items.FindByValue(Request.QueryString["state"]).Selected = true;
            }
        }

        if (Request.QueryString["party"] != null)
        {
            string[] partyList = Request.QueryString["party"].Split(',');
            for (int i = 0; i < partyList.Length; i++)
            {
                ListItem item = party.Items.FindByValue(partyList[i]);
                if (item != null)
                {
                    party.Items.FindByValue(partyList[i]).Selected = true;
                }
            }
        }

        if (Request.QueryString["date"] != null)
        {
            ListItem item = date.Items.FindByValue(Request.QueryString["date"]);
            if (item != null)
            {
                date.Items.FindByValue(Request.QueryString["date"]).Selected = true;
            }
        }
        //END SET DEFAULT VALUE

        if (HttpContext.Current.Request.HttpMethod == "GET")
        {
            populateData();
        }
    }

    public string connectionString()
    {
        return ConfigurationManager.ConnectionStrings["conString"].ConnectionString;
    }

    public DataSet getStateData()
    {
        string constr = connectionString();
        SqlConnection con = new SqlConnection(constr);
        try
        {
            con.Open();
            SqlCommand com = new SqlCommand("SELECT * FROM GE14State", con);
            SqlDataAdapter da = new SqlDataAdapter(com);
            DataSet ds = new DataSet();
            da.Fill(ds);
            return ds;
        }
        catch (Exception ex)
        {
            Logger.LogError("Event getStateData " + ex.ToString());
            return null;
        }
        finally
        {
            con.Close();
            con.Dispose();
        }
    }

    public DataSet getDateData()
    {
        string constr = connectionString();
        SqlConnection con = new SqlConnection(constr);
        try
        {
            con.Open();
            SqlCommand com = new SqlCommand("SELECT CONCAT( DAY(date), '-', MONTH(date) ,'-', YEAR(date) ) as date, CONCAT( DATENAME(month, date) , ' ', YEAR(date)) as 'date_parent' FROM GE15Events WHERE date IS NOT NULL GROUP BY date ORDER BY date ASC", con);
            SqlDataAdapter da = new SqlDataAdapter(com);
            DataSet ds = new DataSet();
            da.Fill(ds);
            return ds;
        }
        catch (Exception ex)
        {
            Logger.LogError("Event getDateData " + ex.ToString());
            return null;
        }
        finally
        {
            con.Close();
            con.Dispose();
        }
    }

    private DataSet getPartyData()
    {
        string constr = connectionString();
        SqlConnection con = new SqlConnection(constr);
        try
        {
            con.Open();
            SqlCommand com = new SqlCommand("SELECT Party, GE15CoalitionParty.Name as 'CoalitionName' FROM GE14Party  JOIN GE15CoalitionParty ON GE14Party.CoalitionPartyId = GE15CoalitionParty.CoalitionPartyId", con);
            SqlDataAdapter da = new SqlDataAdapter(com);
            DataSet ds = new DataSet();
            da.Fill(ds);
            return ds;
        }
        catch (Exception ex)
        {
            Logger.LogError("Event getPartyData " + ex.ToString());
            return null;
        }
        finally
        {
            con.Close();
            con.Dispose();
        }
    }
 
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        string[] keys = Request.Form.AllKeys;
        string strParameter = "";
        for (int i = 0; i < keys.Length; i++)
        {
            if (searchAcceptParameter.Contains(keys[i]) && Request.Form[keys[i]] != String.Empty)
            {
                if (strParameter == String.Empty)
                {
                    strParameter = keys[i] + "=" + HttpUtility.UrlEncode(Request.Form[keys[i]]);
                }
                else
                {
                    strParameter += "&" + keys[i] + "=" + HttpUtility.UrlEncode(Request.Form[keys[i]]);
                }
            }
        }
        Response.Redirect("/Events.aspx?"+ strParameter);
    }

    public void populateData()
    {
        try
        {
            int page = 0;
            int perPage = 10;
            try
            {
                if (Request.QueryString["page"] != null)
                {
                    page = int.Parse(Request.QueryString["page"]);
                }
            }
            catch(FormatException fe)
            {

            }
            
            string[] inQuery = new string[] { };
            List<string> andQuery = new List<string>();

            if (Request.QueryString["keyword"] != null)
            {
                andQuery.Add("( EventTitle LIKE '%" +Request.QueryString["keyword"]+ "%' OR EventSummary LIKE '%" + Request.QueryString["keyword"] + "%' OR LOCATION LIKE '%" + Request.QueryString["keyword"] + "%' )");
            }

            if (Request.QueryString["state"] != null)
            {
                andQuery.Add("StateID = " + Request.QueryString["state"]);
            }

            if (Request.QueryString["date"] != null)
            {
                DateTime dateRaw = DateTime.ParseExact(Request.QueryString["date"], "d-M-yyyy", CultureInfo.InvariantCulture);
                andQuery.Add("Date >= '" + dateRaw.ToString("yyyy-MM-dd") + " 00:00:00' AND Date <= '" + dateRaw.ToString("yyyy-MM-dd") + " 23:59:59' ");
            }

            if (Request.QueryString["party"] != null)
            {
                string[] partyList = Request.QueryString["party"].Split(',');
                string strPartyIn = "";
                for (int i = 0; i < partyList.Length; i++)
                {
                    if(i == 0)
                    {
                        strPartyIn = " Party LIKE '%" + partyList[i] + "%'";
                    }
                    else
                    {
                         strPartyIn += " OR Party LIKE '%" + partyList[i] + "%'";
                    }
                }

                andQuery.Add("( " + strPartyIn + ")");
            }

            String query = "WHERE (archive IS null OR archive = 0) ";
            if (andQuery.Count != 0)
            {
                query = " WHERE (archive IS null OR archive = 0) AND " + string.Join(" AND ", andQuery);
            }

            string constr = connectionString();
            SqlConnection con = new SqlConnection(constr);
            
            //COUNT TOTAL RECORD
            con.Open();
            SqlCommand comCount = new SqlCommand("SELECT COUNT(1) FROM GE15Events " + query, con);
            SqlDataAdapter daCount = new SqlDataAdapter(comCount);
            double RecordCount = Convert.ToDouble(comCount.ExecuteScalar());
            double pageCountRaw = RecordCount / perPage;
            int pageCount = Convert.ToInt32(pageCountRaw);
            int pageIndicator = 1;
            if(page == 0)
            {
                pageIndicator = 1;
            }
            else
            {
                pageIndicator = page;
            }

            if(pageCount > 0)
            {
                StringBuilder htmlCount = new StringBuilder();
                string[] keys = Request.QueryString.AllKeys;
                String linkParameter = "";
                for (int i = 0; i < keys.Length; i++)
                {
                    if (searchAcceptParameter.Contains(keys[i]) && Request.QueryString[keys[i]] != String.Empty)
                    {
                        if (linkParameter == String.Empty)
                        {
                            linkParameter = keys[i] + "=" + HttpUtility.UrlEncode(Request.QueryString[keys[i]]);
                        }
                        else
                        {
                            linkParameter += "&" + keys[i] + "=" + HttpUtility.UrlEncode(Request.QueryString[keys[i]]);
                        }
                    }
                }

                if(pageIndicator != 1)
                {
                    htmlCount.Append("<li class='pager-nav disabled' aria-disabled='true' aria-label='« Previous'><span class='' aria-hidden='true'>«</span></li>");
                }
                else
                {
                    htmlCount.Append("<li style='display: none;' class='pager-nav disabled' aria-disabled='true' aria-label='« Previous'><span class='' aria-hidden='true'>«</span></li>");
                }
            
                for (int i = 1; i <= pageCount; i++)
                {
                    if(pageIndicator == i)
                    {
                        htmlCount.Append("<li class='pager-nav active' aria-current='page'><a class=''>" + i + "</a></li>");
                    }
                    else
                    {
                        String finalLink = "";
                        if (linkParameter == String.Empty)
                        {
                            finalLink = "/Events.aspx?page=" + i;
                        }
                        else
                        {
                            finalLink = "/Events.aspx?page=" + i + "&" + linkParameter;
                        }
                        htmlCount.Append("<li class='pager-nav' aria-current='page'><a class='' href='"+ finalLink + "' >" + i + "</a></li>");
                    }
                
                }

                if (pageIndicator == pageCount)
                {
                    htmlCount.Append("<li style='display: none;' class='pager-nav'><a class='' href='' rel='next' aria-label='Next »' >»</a></li>");
                }
                else
                {
                    htmlCount.Append("<li class='pager-nav'><a class='' href='' rel='next' aria-label='Next »' >»</a></li>");
                }
                pager_div.Controls.Add(new Literal { Text = htmlCount.ToString() });
            }
            con.Close();
            //END COUNT TOTAL RECORD

            //DATA
            if(page > 1)
            {
                page = page - 1;
            }
            else
            {
                page = 0;
            }
            string querySearch = "SELECT * FROM GE15Events " + query + " ORDER BY CreatedDate OFFSET " + (page * perPage) + " ROWS FETCH NEXT " + perPage + " ROWS ONLY ";
            con.Open();
            SqlCommand com = new SqlCommand(querySearch, con);
            SqlDataAdapter da = new SqlDataAdapter(com);
            DataSet ds = new DataSet();
            da.Fill(ds);
            DataTable dt = new DataTable();
            dt = ds.Tables[0];
            StringBuilder html = new StringBuilder();
            foreach (DataRow drow in dt.Rows)
            {
                String dateFormat = "EMPTY DATE";
                String dateFormatFull = "EMPTY DATE";
                if (drow["Date"].ToString() != "")
                {
                    DateTime dateSelected = Convert.ToDateTime(drow["Date"]);
                    dateFormat = dateSelected.ToString("MMM dd");
                    dateFormatFull = dateSelected.ToString("dd MMMM yyyy");
                }

                html.Append("<div class='event__item'>");
                html.Append("<div class='event__date'>");
                html.Append(dateFormat);
                html.Append("</div>");
                html.Append("<div class='event__image'>");

                string imgUrl = drow["EventImage"].ToString();
                if(imgUrl == "" || !urlExists(imgUrl) )
                {
                    imgUrl = ConfigurationManager.AppSettings["defaultPhoto"]; //DEFAULT PHOTO
                }
                html.Append("<img class='img-responsive fixImg' src='"+ imgUrl + "' alt=''>");

                string summary = drow["EventSummary"].ToString();
                summary = summary.Replace("\n", "<br />\n");

                html.Append("</div>");
                html.Append("<div class='event__details'>");
                html.Append("<h2 class='event__title'>");
                html.Append(drow["EventTitle"].ToString());
                html.Append("</h2>");
                html.Append("<p class='event__desc'>");
                html.Append(summary);
                html.Append("</p>");
                html.Append("<div class='event__subdetails'>");
                html.Append("<span class='event__datetime'>");
                html.Append("<i class='ico fa fa-calendar'></i>");
                html.Append("<span>"+ dateFormatFull + "</span>");
                html.Append("</span>");
                if (drow["Time"].ToString() != "")
                {
                    html.Append("<span class='event__datetime'>");
                    html.Append("<i class='ico fa fa-clock-o'></i>");
                    html.Append("<span>" + drow["Time"].ToString() + "</span>");
                    html.Append("</span>");
                }
                html.Append("<p class='event__location'>");
                html.Append("<i class='ico fa fa-map-marker'></i>");
                if (drow["StateID"].ToString() != "")
                {
                    html.Append("<span class='event__address'>" + drow["Location"].ToString() + ", " + stateData[drow["StateID"].ToString()] + "</span>");
                }
                else
                {
                    html.Append("<span class='event__address'>" + drow["Location"].ToString() + "</span>");
                }

                html.Append("</p>");

                string url = drow["MoreInfoUrl"].ToString();
                string httpText = "http://";
                string httpsText = "https://";
                if(!url.Contains(httpText) || !url.Contains(httpsText))
                {
                    url = httpsText + url;
                }

                if (urlExists(url))
                {
                    html.Append("<a href = '" + url + "' class='event__link'><i class='ico fa fa-link'></i>" + drow["MoreInfoText"].ToString() + "</a>");
                }

                html.Append("</div>");
                html.Append("</div>");
                html.Append("</div>");
            }
            
            if(RecordCount == 0)
            {
                html.Append("<div class='event__item' style='height: 630px;'>");
                html.Append("<div class='col-lg-12' style='text-align: center; font-weight: bold; '>Sorry, no record found.</div>");
                html.Append("</div>");
            }

            con.Close();
            con.Dispose();
            //END DATA
            //Append the HTML string to Placeholder.
            event_div.Controls.Add(new Literal { Text = html.ToString() });
        }
        catch (Exception ex)
        {
            Logger.LogError("Event populateData " + ex.ToString());
        }
    }
    private bool urlExists(string url)
    {
        try
        {
            HttpWebRequest request = WebRequest.Create(url) as HttpWebRequest;
            request.Method = "HEAD";
            HttpWebResponse response = request.GetResponse() as HttpWebResponse;
            response.Close();
            return (response.StatusCode == HttpStatusCode.OK);
        }
        catch
        {
            return false;
        }
    }
}