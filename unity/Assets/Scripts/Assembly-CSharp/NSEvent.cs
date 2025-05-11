using LuaInterface;

public class NSEvent
{
	public NSEventType Type { get; private set; }

	public ushort MessageID { get; private set; }

	public LuaByteBuffer Message { get; private set; }

	public string ErrorText { get; private set; }

	public NSEvent(NSEventType type, string errorText = "")
	{
	}

	public NSEvent(NSEventType type, ushort messageID, byte[] message, string errorText = "")
	{
	}
}
