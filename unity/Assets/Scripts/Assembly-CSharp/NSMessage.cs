public class NSMessage
{
	public uint Size { get; set; }

	public ushort Type { get; set; }

	public uint SequenceIDf { get; set; }

	public uint SequenceIDb { get; set; }

	public byte[] Data { get; set; }
}
