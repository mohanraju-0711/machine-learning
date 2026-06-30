import pandas as pd
from sklearn.datasets import load_iris
from sklearn.model_selection import train_test_split
from sklearn.preprocessing import StandardScaler
from sklearn.neighbors import KNeighborsClassifier
from sklearn.svm import SVC
from sklearn.metrics import accuracy_score, classification_report

# Load dataset
iris = load_iris()

df = pd.DataFrame(iris.data, columns=iris.feature_names)
df["target"] = iris.target

print("Dataset:")
print(df.head())

# Features and target
X = df.drop("target", axis=1)
y = df["target"]

# Train-test split
X_train, X_test, y_train, y_test = train_test_split(
    X, y, test_size=0.2, random_state=42
)

# Scaling is important for KNN and SVM
scaler = StandardScaler()

X_train_scaled = scaler.fit_transform(X_train)
X_test_scaled = scaler.transform(X_test)

# -------------------------
# KNN Model
# -------------------------
knn_model = KNeighborsClassifier(n_neighbors=5)
knn_model.fit(X_train_scaled, y_train)

knn_predictions = knn_model.predict(X_test_scaled)

print("\nKNN Accuracy:", accuracy_score(y_test, knn_predictions))
print("\nKNN Classification Report:")
print(classification_report(y_test, knn_predictions, target_names=iris.target_names))

# -------------------------
# SVM Model
# -------------------------
svm_model = SVC(kernel="linear")
svm_model.fit(X_train_scaled, y_train)

svm_predictions = svm_model.predict(X_test_scaled)

print("\nSVM Accuracy:", accuracy_score(y_test, svm_predictions))
print("\nSVM Classification Report:")
print(classification_report(y_test, svm_predictions, target_names=iris.target_names))

# -------------------------
# Predict new flower
# -------------------------
new_flower = [[5.1, 3.5, 1.4, 0.2]]
new_flower_scaled = scaler.transform(new_flower)

knn_result = knn_model.predict(new_flower_scaled)
svm_result = svm_model.predict(new_flower_scaled)

print("\nNew Flower Prediction:")
print("KNN Prediction:", iris.target_names[knn_result[0]])
print("SVM Prediction:", iris.target_names[svm_result[0]])
