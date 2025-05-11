using System;
using System.Runtime.InteropServices;

public class LZ4
{
	internal static bool isle;

	private const string libname = "lz4";

	[PreserveSig]
	internal static extern int z4setPermissions(string filePath, string _user, string _group, string _other);

	[PreserveSig]
	internal static extern int LZ4DecompressFile(string inFile, string outFile, IntPtr bytes, IntPtr FileBuffer, int fileBufferLength);

	[PreserveSig]
	internal static extern int LZ4CompressFile(string inFile, string outFile, int level, IntPtr percentage, ref float rate);

	[PreserveSig]
	internal static extern int LZ4releaseBuffer(IntPtr buffer);

	[PreserveSig]
	internal static extern IntPtr LZ4CompressBuffer(IntPtr buffer, int bufferLength, ref int v, int level);

	[PreserveSig]
	internal static extern int LZ4DecompressBuffer(IntPtr buffer, IntPtr outbuffer, int bufferLength);

	public static int setFilePermissions(string filePath, string _user, string _group, string _other)
	{
		return 0;
	}

	public static float compress(string inFile, string outFile, int level, float[] progress)
	{
		return 0f;
	}

	public static int decompress(string inFile, string outFile, int[] bytes, byte[] FileBuffer = null)
	{
		return 0;
	}

	public static bool compressBuffer(byte[] inBuffer, ref byte[] outBuffer, int level, bool includeSize = true)
	{
		return false;
	}

	public static byte[] compressBuffer(byte[] inBuffer, int level, bool includeSize = true)
	{
		return null;
	}

	public static int compressBufferPartialFixed(byte[] inBuffer, ref byte[] outBuffer, int outBufferPartialIndex, int level, bool includeSize = true)
	{
		return 0;
	}

	public static int decompressBufferPartialFixed(byte[] inBuffer, ref byte[] outBuffer, int partialIndex, int compressedBufferSize, bool safe = true, bool useFooter = true, int customLength = 0)
	{
		return 0;
	}

	public static bool decompressBuffer(byte[] inBuffer, ref byte[] outBuffer, bool useFooter = true, int customLength = 0)
	{
		return false;
	}

	public static int decompressBufferFixed(byte[] inBuffer, ref byte[] outBuffer, bool safe = true, bool useFooter = true, int customLength = 0)
	{
		return 0;
	}

	public static byte[] decompressBuffer(byte[] inBuffer, bool useFooter = true, int customLength = 0)
	{
		return null;
	}
}
