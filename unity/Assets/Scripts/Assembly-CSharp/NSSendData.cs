public class NSSendData
{
	public uint Length { get; private set; }

	public ushort Type { get; private set; }

	public byte[] Data { get; private set; }

	public NSSendData(ushort type, byte[] data)
	{
	}
}
