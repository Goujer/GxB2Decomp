namespace Org.BouncyCastle.Crypto.Tls
{
	public class SupplementalDataEntry
	{
		protected readonly int mDataType;

		protected readonly byte[] mData;

		public virtual int DataType
		{
			get
			{
				return 0;
			}
		}

		public virtual byte[] Data
		{
			get
			{
				return null;
			}
		}

		public SupplementalDataEntry(int dataType, byte[] data)
		{
		}
	}
}
