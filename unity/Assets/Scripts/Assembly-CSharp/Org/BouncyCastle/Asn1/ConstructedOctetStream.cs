using System.IO;
using Org.BouncyCastle.Utilities.IO;

namespace Org.BouncyCastle.Asn1
{
	internal class ConstructedOctetStream : BaseInputStream
	{
		private readonly Asn1StreamParser _parser;

		private bool _first;

		private Stream _currentStream;

		internal ConstructedOctetStream(Asn1StreamParser parser)
		{
		}

		public override int Read(byte[] buffer, int offset, int count)
		{
			return 0;
		}

		public override int ReadByte()
		{
			return 0;
		}
	}
}
