using System.Collections.Generic;
using System.Runtime.InteropServices;
using UnityEngine;

public class XYDSDK : MonoBehaviour
{
	[StructLayout(LayoutKind.Auto, Size = 8)]
	public delegate void SdkCallback(string jsonStr);

	private static XYDSDK _instance;

	public SdkCallback onSdkCallback;

	public Dictionary<int, SdkCallback> onSdkCallbacks;

	private AndroidJavaClass _unityPlayer;

	private AndroidJavaObject _currentActivity;

	public static XYDSDK Instance
	{
		get
		{
			return null;
		}
	}

	private void Awake()
	{
	}

	public void Reset()
	{
	}

	public void Run()
	{
	}

	public void SetSDKLanguage()
	{
	}

	public void BeCallFunc(string jsonStr)
	{
	}

	public void BeCallFunc2(string jsonStr)
	{
	}

	public void DeleteSurroundingText(string strLength)
	{
	}

	public void KeyboardCommitText(string text)
	{
	}

	public void ComposingTextEvent(string text)
	{
	}

	public void FinishComposingTextEvent(string text)
	{
	}

	public void ComposingRegionEvent(string lengthStr)
	{
	}

	public void KeyboardVisiabilityChanged(string isKeyboardShown)
	{
	}

	public void DPadLeftEvent(string type)
	{
	}

	public void DPadRightEvent(string type)
	{
	}

	public int GetKeyboardHeight()
	{
		return 0;
	}

	public void ShowKeyboard(int keyboardType, bool autocorrection, bool multiline, bool secure)
	{
	}

	public void ShowKeyboard()
	{
	}

	internal void HideKeyboard()
	{
	}

	public void ForceFinishComposing()
	{
	}

	internal void ToggleKeyboard()
	{
	}

	public void ChangeTopBar(int hide)
	{
	}

	public void Login(int tp)
	{
	}

	public void AccountLogin(string loginEmail, string password)
	{
	}

	public void ShowPayView(string serverID, string giftBagID, string giftBagName, string defaultPrice, string google_currency, string google_price, bool isOn, int currency_amount, string currency_unit, string channelID, string extra)
	{
	}

	public void checkSpecialOrder(string serverID, string giftBagID, string giftBagName, string defaultPrice, string google_currency, string google_price, bool isOn, int currency_amount, string currency_unit, string channelID, string extra)
	{
	}

	public void offerSpecialOrder(string giftBagID, string orderSn)
	{
	}

	public void DoPurchaseWithDefaultMethod(string channelID, string serverID, string packageID, bool is_on)
	{
	}

	public void DoVerticalPay(string channelID, string mainPay, string serverID, string packageID, string packageName, string defaultPrice, bool is_on)
	{
	}

	public void buySubscribe(string channelID, string serverID, string packageID)
	{
	}

	public void FbTracking(string eventName, double valueToSum, string jsonParams)
	{
	}

	public void AfTracking(string eventName, string jsonParams)
	{
	}

	public void anonyUpgrade(string email, string password, string repassword)
	{
	}

	public void TpBind(string tpType)
	{
	}

	public void TpUnbind(string tpType)
	{
	}

	public void GetBindTpType()
	{
	}

	public void DoBeforeSwitch(string tpStr)
	{
	}

	public void OpenHelperActivity(string title)
	{
	}

	public void OpenForum(string title, string url)
	{
	}

	public bool IsAndroidPad()
	{
		return false;
	}

	public void GetPingRes(string str, bool inGame)
	{
	}

	public void GetPingRes2(int opCode, string str, bool inGame, SdkCallback callback)
	{
	}

	public void UpLoadGameLogFile(string playerID, string logPath)
	{
	}

	public void UpLoadGameLogFile2(int opCode, string playerID, string logPath, SdkCallback callback)
	{
	}

	public void ReportMessage(string message)
	{
	}

	public void ReportMessageWithPingAddress(string message, string address, string port)
	{
	}

	public void CancelPing()
	{
	}

	public string GetDeviceID()
	{
		return null;
	}

	public string GetLang()
	{
		return null;
	}

	public string ReadSdcardFile(string path)
	{
		return null;
	}

	public bool WriteSdcardFile(string path, string content)
	{
		return false;
	}

	public bool DeleteSdcardFile(string path)
	{
		return false;
	}

	public void ClearAllNotify()
	{
	}

	public void SetServerNotification(bool value)
	{
	}

	public void CheckPermission(int requestCode, string permissions)
	{
	}

	public void RequestPermission(int requestCode, string permissions)
	{
	}

	public string PopLocalIntentMsg()
	{
		return null;
	}

	public void ShowMafiaLikesWindow(string pageUrl, string pageId)
	{
	}

	public void FbShare(bool useAppLink, string homePage, string title, string link, string msg, string img_link, string tag, string quote, string player_id, string type)
	{
	}

	public void TwitterShare(string msg, string img_link, string tag, string type)
	{
	}

	public void VKShare(string title, string link, string msg, string img_link, string type)
	{
	}

	public void INSShare(string img_link, string type)
	{
	}

	public void AfterAutoLogin()
	{
	}

	public void RestartGame()
	{
	}

	public void PickupGallery()
	{
	}

	public void GetImageFromAlbum()
	{
	}

	public void TakePhoto()
	{
	}

	public void QuitGame()
	{
	}

	public void AddSdkCallback(int opCode, SdkCallback callback)
	{
	}

	public void RemoveSdkCallback(int opCode)
	{
	}

	public void RemoveAllSdkCallback()
	{
	}

	public void TempFunc(string str)
	{
	}

	public int AndroidOSVersion()
	{
		return 0;
	}

	public void TrackStart(int playerID)
	{
	}

	public void LogEvent(string str)
	{
	}

	public void CallIOSSDKFunc(string type, string jsonParam)
	{
	}

	public void CallIOSSDKFunc2(int opCode, string type, string jsonParam, SdkCallback callback)
	{
	}

	public static string ReadSDCardFile(string path)
	{
		return null;
	}

	public static bool WriteSDCardFile(string path, string content)
	{
		return false;
	}

	public bool DeleteSDCardFile(string path)
	{
		return false;
	}

	public static string GetDeviceLang()
	{
		return null;
	}

	public static int GetAndroidOSVersion()
	{
		return 0;
	}

	public void ShowGoogleRewardVideoAd()
	{
	}

	public void ShareTextToOtherApp(string type, string jsonParams)
	{
	}

	public void GetPrivacyState(string type)
	{
	}

	public void ShowPrivacyDialogView(string type)
	{
	}
}
